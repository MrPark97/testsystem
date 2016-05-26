package main

import (
	"encoding/json"
	"io"
	"log"
	"math/rand"
	"net/http"
	"os"
	"strconv"
	"strings"
	"text/template"
)

const (
	testLen = 50
)

func main() {
	http.HandleFunc("/", testStart)
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static/"))))
	err := http.ListenAndServe(":8000", nil)
	if err != nil {
		panic(err)
	}
}

type Test struct {
	Question, A, B, C, D, True string
	Id                         int64
}

func testStart(w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		log.Println("error while parsing form", err)
	}

	values := r.Form
	if values.Get("testStatus") == "testComplete" {
		var inFile *os.File
		if inFile, err = os.Open("json/test.json"); err != nil {
			log.Fatal(err)
		}
		defer inFile.Close()

		dec := json.NewDecoder(inFile)

		ansM := map[string]string{}

		for {
			var t Test
			if err := dec.Decode(&t); err == io.EOF {
				break
			} else if err != nil {
				log.Println(err)
			}
			ansM[strconv.FormatInt(t.Id, 10)] = t.True
		}

		var TrueAnswers, FalseAnswers int64
		for k, v := range values {
			if strings.Contains(k, "group") {
				log.Println(ansM[k[len("group"):]])
				log.Println(v[0])
				if(ansM[k[len("group"):]] == v[0]) {
					TrueAnswers++
				} else {
					FalseAnswers++
				}
			}
		}

		data := struct {
			True, False int64
		}{
			TrueAnswers,
			FalseAnswers,
		}

		t, err := template.ParseFiles("templates/result.tpl")
		if err != nil {
			log.Println("template error", err)
		}

		err = t.Execute(w, data)
		if err != nil {
			log.Println("template print error", err)
		}
	} else {
		var inFile *os.File
		if inFile, err = os.Open("json/test.json"); err != nil {
			log.Fatal(err)
		}
		defer inFile.Close()

		dec := json.NewDecoder(inFile)

		testSlice := []Test{}

		for {
			var t Test
			if err := dec.Decode(&t); err == io.EOF {
				break
			} else if err != nil {
				log.Println(err)
			}
			testSlice = append(testSlice, t)
		}

		l := len(testSlice)
		ansSlice := []Test{}
		for i := 0; i < testLen && i < l; i++ {
			e := rand.Intn(len(testSlice))
			ansSlice = append(ansSlice, testSlice[e])
			testSlice = RemoveTestSlice(testSlice, e, e+1)
		}

		data := struct {
			Tests []Test
		}{
			ansSlice,
		}

		t, err := template.ParseFiles("templates/index.tpl")
		if err != nil {
			log.Println("template error", err)
		}

		err = t.Execute(w, data)
		if err != nil {
			log.Println("template print error", err)
		}
	}
}

func RemoveTestSlice(slice []Test, start, end int) []Test {
	return append(slice[:start], slice[end:]...)
}
