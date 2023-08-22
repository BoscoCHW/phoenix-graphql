# GraphQL Backend Tutorial with Phoenix & Absinthe

Welcome to this comprehensive tutorial on creating a GraphQL backend using the Phoenix framework and Absinthe. Tailored for educational purposes, this repository dives deep into various GraphQL concepts while utilizing Phoenix's robustness and Absinthe's flexibility.

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Setup and Installation](#setup-and-installation)
4. [Tutorial Breakdown](#tutorial-breakdown)
5. [Running the Server](#running-the-server)
6. [Feedback and Contribution](#feedback-and-contribution)

## Introduction

GraphQL provides a more efficient, flexible, and powerful alternative to the traditional REST API. With Phoenix's productive web framework and Absinthe's GraphQL toolkit, building scalable and maintainable APIs becomes a breeze.

## Prerequisites

- Elixir and Erlang (Refer to the [official documentation](https://elixir-lang.org/install.html) for installation)
- Phoenix Framework
- PostgreSQL (with necessary configurations)
  
## Setup and Installation

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Install dependencies with `mix deps.get`.
4. Create and migrate your database with `mix ecto.setup`.
  
## Tutorial Breakdown

1. **Schema Definition**: Understand the importance and structure of schemas in GraphQL.
2. **Basic Types**: Dive into GraphQL's type system, ensuring your API's shape and nature are as expected.
3. **Custom Types**: Extend GraphQL's type capabilities for more complex structures.
4. **Queries**: Fetch data with specifically shaped requests tailored to your frontend needs.
5. **Mutations**: Learn how to modify server-side data using GraphQL.
6. **Subscriptions**: Enable real-time functionalities and understand GraphQL's subscription mechanism.
7. **Custom Resolvers**: Dive deeper into field-level logic encapsulation.
8. **Dataloader**: Optimize data loading from databases, APIs, or other data sources.

Each section in the tutorial comes with relevant code examples and explanations. Navigate to the respective folders or files for a deep dive into each topic.

## Running the Server

1. Start the Phoenix server with `mix phx.server`.
2. Access the interactive GraphQL playground at [`localhost:4000/api/graphiql`](http://localhost:4000/api/graphiql).

## Feedback and Contribution

We welcome contributions, feedback, or issues. Feel free to submit a PR or drop an issue for any corrections, enhancements, or clarifications.

---

**Happy Coding and Exploring GraphQL with Phoenix & Absinthe!**
