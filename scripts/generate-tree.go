package main

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
)

var directories = []string{
	"cmd/{projectname}",
	"cmd/{projectname}-cli",
	"pkg/mylib",
	"internal/myinternalpkg",
	"api/v1",
	"configs",
	"scripts",
	"build",
	"docs",
	"test/integration",
	"test/e2e",
}

var files = map[string]string{
	"README.md":                "Project Readme",
	"go.mod":                   "module {projectname}\n\ngo 1.20",
	"go.sum":                   "",
	"LICENSE":                  "MIT License",
	"cmd/{projectname}/main.go":        "package main\n\nfunc main() {\n\t// TODO: implement\n}",
	"cmd/{projectname}-cli/main.go":    "package main\n\nfunc main() {\n\t// TODO: implement\n}",
	"pkg/mylib/mylib.go":       "package mylib\n\n// TODO: implement",
	"internal/myinternalpkg/myinternalpkg.go": "package myinternalpkg\n\n// TODO: implement",
	"api/v1/api.proto":         "// TODO: API definitions",
	"api/v1/api.go":            "package v1\n\n// TODO: implement",
	"configs/config.yaml":      "# TODO: Configuration",
	"configs/dev.yaml":         "# TODO: Development configuration",
	"configs/prod.yaml":        "# TODO: Production configuration",
	"scripts/build.sh":         "#!/bin/bash\n\n# TODO: Build script",
	"scripts/deploy.sh":        "#!/bin/bash\n\n# TODO: Deploy script",
	"scripts/test.sh":          "#!/bin/bash\n\n# TODO: Test script",
	"build/Dockerfile":         "# TODO: Dockerfile",
	"build/Makefile":           "# TODO: Makefile",
	"docs/design.md":           "# Design Documentation\n\n# TODO: design documentation",
	"docs/architecture.md":     "# Architecture Documentation\n\n# TODO: architecture documentation",
	"test/integration/integration_test.go": "package integration\n\n// TODO: integration tests",
	"test/e2e/e2e_test.go":     "package e2e\n\n// TODO: end-to-end tests",
}

func createDirectories(base string, dirs []string, projectName string) error {
	for _, dir := range dirs {
		path := filepath.Join(base, strings.ReplaceAll(dir, "{projectname}", projectName))
		err := os.MkdirAll(path, os.ModePerm)
		if err != nil {
			return err
		}
		fmt.Println("Created directory:", path)
	}
	return nil
}

func createFiles(base string, files map[string]string, projectName string) error {
	for path, content := range files {
		fullPath := filepath.Join(base, strings.ReplaceAll(path, "{projectname}", projectName))
		content = strings.ReplaceAll(content, "{projectname}", projectName)
		err := os.WriteFile(fullPath, []byte(content), 0644)
		if err != nil {
			return err
		}
		fmt.Println("Created file:", fullPath)
	}
	return nil
}

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: go run generate_structure.go <project_name>")
		return
	}

	projectName := os.Args[1]

	err := createDirectories(projectName, directories, projectName)
	if err != nil {
		fmt.Println("Error creating directories:", err)
		return
	}

	err = createFiles(projectName, files, projectName)
	if err != nil {
		fmt.Println("Error creating files:", err)
		return
	}

	fmt.Println("Project structure created successfully")
}

