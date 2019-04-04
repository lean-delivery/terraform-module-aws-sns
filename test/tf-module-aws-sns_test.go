package test

import (
	"testing"
	// "fmt"
	"time"
    "math/rand"
	"github.com/gruntwork-io/terratest/modules/terraform"
	// "github.com/stretchr/testify/assert"
)

var terraformDirectory = "../examples"
var region             = "us-east-1"
var account            = ""

func Test_SetUp(t *testing.T) {
	rand.Seed(time.Now().UnixNano())

	terraformOptions := &terraform.Options{
		TerraformDir: terraformDirectory,
		Vars: map[string]interface{}{
			"aws_region": region,
			"name"      : "test_sns" + randSeq(10),
		},
	}
	defer terraform.Destroy(t, terraformOptions)
	terraform.Init(t, terraformOptions)
	terraform.Apply(t, terraformOptions)
	account = terraform.Output(t, terraformOptions, "account_id")
}

func randSeq(n int) string {
	letters := []rune("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    b := make([]rune, n)
    for i := range b {
        b[i] = letters[rand.Intn(len(letters))]
    }
    return string(b)
}
