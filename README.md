# DevOps implementation for mock Java Application

test commit

Application is bootstrapped using Spring boot framework which is a popular project scaffolding choice in enterprise applications. This is a mock application implementing REST API to store and manipulate collection of `Employee` objects. Data is stored and queried using in memory database H2.

Additionally HATEOS plugin for spring framework is also setup which helps in auto generation of links in REST responses that allows automated navigation of API.

## Available 

1. `GET /employees`
2. `POST /employees`
3. `GET /employees/{id}`
4. `PUT /employees/{id}`
5. `DELETE /employees/{id}`

### Sample Response
```sh
curl localhost:8080/employees | jq .

{
  "_embedded": {
    "employeeList": [
      {
        "id": 1,
        "name": "Diksha Dahiya",
        "role": "CEO",
        "_links": {
          "self": {
            "href": "http://localhost:8080/employees/1"
          },
          "employees": {
            "href": "http://localhost:8080/employees"
          }
        }
      },
      {
        "id": 2,
        "name": "Naveen Chaudhary",
        "role": "Security Guard",
        "_links": {
          "self": {
            "href": "http://localhost:8080/employees/2"
          },
          "employees": {
            "href": "http://localhost:8080/employees"
          }
        }
      }
    ]
  },
  "_links": {
    "self": {
      "href": "http://localhost:8080/employees"
    }
  }
}
```
## Use of Github Actions as choice of CI/CD Tools
Originally in the submitted thesis abstract, I was targeting to use Gitlab CI/CD for DevOps implementation. While implementing, I was asked for credit card details as assurance to use free credits. Github actions are free to use for public projects so I have decided to learn and use Github actions to implement DevOps concept in this project.

### Progress so far
So far I have written a simple test and build workflow for maven projects using Github actions. Workflow configuration file is `.github/workflows/build.yml`.

It has only one stage, "Test and Build" which is also the case in my corporate Java project. I am also making use of predefined actions available on Github to perform common repetitive tasks like git clone project files during build and uploading maven cache for reuse. Workflow can be triggered manually or by pushing a commit to main branch.

## Roadmap ahead
- Restructure job stages into
  - Lint
  - SAST (Static application security testing)
  - Dependency analysis for known vulnerabilities
  - Maven Build
  - Maven Test (Unit tests and end to end tests)
  - Package and publish built artifacts in docker image
  - Deploy service on cloud using published docker image
  - Implement GitOps for deployment
  - Compare GitOps and DevOps

