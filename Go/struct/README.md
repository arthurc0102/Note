```go
package main

import (
	"fmt"
	"reflect"
)

type User struct {
	Username string
	Email    string
	Age      uint
}

type UserForm struct {
	Email string
	Age   uint
}

func main() {
	uf := UserForm{
		Email: "arthurc0102@gmail.com",
		Age:   20,
	}

	u := new(User)
	structConvert(uf, u)
	fmt.Println(u)
}

func structConvert(target interface{}, result interface{}) {
	targetV := reflect.ValueOf(target)
	resultV := reflect.ValueOf(result)

	if targetV.Kind() != reflect.Struct {
		panic("Target should be struct")
	}

	if resultV.Kind() != reflect.Ptr {
		panic("Result should be a pointer")
	}

	resultV = resultV.Elem()
	targetFieldMap := map[string]reflect.Value{}

	for i := 0; i < targetV.NumField(); i++ {
		targetFieldMap[targetV.Type().Field(i).Name] = targetV.Field(i)
	}

	for k, v := range targetFieldMap {
		f := resultV.FieldByName(k)

		if !f.IsValid() || f.Type() != v.Type() {
			continue
		}

		f.Set(v)
	}
}

func printStruct(target interface{}) {
	vf := reflect.ValueOf(target)
	tf := vf.Type()

	if vf.Kind() != reflect.Struct {
		panic("This is not a struct")
	}

	for i := 0; i < vf.NumField(); i++ {
		f := vf.Field(i)
		fmt.Printf("%d: %s (%s) => %v\n", i, tf.Field(i).Name, f.Type(), f.Interface())
	}
}
```
