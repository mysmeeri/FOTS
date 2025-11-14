# Find Optimal Time Slot backend API and infra

## Summary

Your mission is to build a backend API for application called Find Optimal Time Slot. It is an application that is used to find most suitable time slots. API takes participant preferred time slots as an input and returns best match(es) (most participants can participate) as output. Your assignment is to implement the backend API and set up both the required infrastructure and the CI/CD pipeline for development. Frontend is not part of your assignment.

## Requirements

Requirement:

- working REST API that can be used with HTTP calls
- cloud infrastructure to host the API
- a CI/CD pipeline which builds and deploys the API from the developer's laptop to the cloud infrastructure
- infrastructure and CI/CD pipeline have to be implemented as code (IaC)

Relaxations to requirements:

- no persistent data storage needed, all information required is given in the input
- the API can be called either from the public internet, your computer or inside some specific network

Things that you can select freely:

- you're free to choose the programming language and framework
- you can choose the architectural design and patterns freely
- you can select in which cloud the application will be hosted (either a real cloud or a cloud emulator)
- you can freely select your IaC language (like Terraform, Pulumi, Bicep, CloudFormation, etc.)
  - if you don't have strong preferences, use Terraform
- you can select your CI/CD tool
  - if you don't have strong preferences, use GitHub Actions

Things that we pay attention to:

- IaC
- pipeline works well enough so you can push code and it eventually runs in some environment
- if you use any secrets, they are handled securely

Notice:

- it is enough to discuss, for example, how you would have implemented proper networking in a real application, instead of implementing network security controls

## Deliverable

- The deliverable should be a publicly accessible repository containing the backend API, CI/CD and infra code
- Simple drawing of the infra/cloud architecture (you decide the drawing tool)
- README file containing short instructions on how to
  - run application
    - guide on how to run the backend API
    - guide how to send an HTTP request to the API
  - infra setup
    - pre-deployment steps that are required before you can use CI/CD to push code and infra, if any
  - CI/CD
    - command how to push changes to the infra and application

## Guidelines

- Showcase your abilities, and use the task to demonstrate your idea of best practices, regarding coding style, project structure, frameworks, patterns, design, testing etc.
- There is no right or wrong solution, as long as it is your solution.
- If you don't have time to implement something well enough, prepare to describe how you would have done it if you had more time
- Be prepared to describe your work in detail

## Deadline

In order for us to have time to have a look at your solution, **please return the assignment at the latest during the previous working day before your interview.** If at all feasible, bring your own laptop for reviewing your solution.

## Tips & hints

- GitHub Actions can be used for free for public repositories
- You can get free trials of the public clouds, with some predefined free services and/or credits. Make sure to use budget alerts to avoid costs
- There are some cloud and tooling emulators also available if you want to avoid costs, for example
  - AWS: [localstack](https://github.com/localstack/localstack)
  - Azure: [localstack for Azure, experimental](https://azure.localstack.cloud/introduction/)
  - GitHub Actions: [act](https://github.com/nektos/act)

## API specifications

**Logic:**
The API should get preferred time slots as an input, find all unique time slots, count how many participants are available at each slot, and return:

- The slot(s) with the highest number of available participants
- The list of participants for each top slot
- Error if no matches can be found
- Error if invalid input

**API request and response examples**

**POST /api/v1/meetings/optimize**
**Request Example:**

```
{
  "meetingName": "Design Sync",
  "participants": [
    {
      "name": "Alice",
      "preferredSlots": [
        "2024-06-10T09:00",
        "2024-06-10T10:00",
        "2024-06-10T13:00"
      ]
    },
    {
      "name": "Bob",
      "preferredSlots": [
        "2024-06-10T10:00",
        "2024-06-10T13:00"
      ]
    },
    {
      "name": "Carol",
      "preferredSlots": [
        "2024-06-10T09:00",
        "2024-06-10T10:00"
      ]
    }
  ]
}
```

**Response Example:**

```
{
  "meetingName": "Design Sync",
  "optimalSlots": [
    {
      "slot": "2024-06-10T10:00",
      "participants": ["Alice", "Bob", "Carol"]
    }
  ],
  "maxParticipants": 3
}
```
