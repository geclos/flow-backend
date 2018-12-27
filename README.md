# Flow backend

This repo is for demonstration purposes.

It contains all backend code of a personal project I'm working on in private. It's a service where companies can sign up and conduct internal polls with their employees. These internal polls are organized on Campaigns to which the admin can invite an arbitrary amount of employees.

Polls are conducted via Typeform and respondants are identified via unique poll_token attached to the campaign membership.

Goal (not coded yet) is to process all responses and display graphs with munched data from the responses.

## Stack

Modularized Ruby on Rails application with MySQL db. Try to follow DDD principles with the use of interactors and services as "use cases" to apply to my domain logic.

Mainly unit tests with some integration tests at the controller level. There's not 100% coverage and do not aspire to it yet; goal is to code fast and iterate quickly.
