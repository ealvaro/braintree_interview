### README

## Overview

This project implements a basic credit card processing system. The program supports adding new credit card accounts, processing charges and credits, and generating summary information. The design follows a simple, object-oriented approach, where each credit card is modeled by a `CreditCard` class and managed by a `CreditCardProcessor` class.

### Design Decisions

- **Object-Oriented Design**: The program uses two main classes: `CreditCard` to model individual credit cards and `CreditCardProcessor` to manage multiple credit cards and process commands.
- **Luhn 10 Validation**: The `CreditCard` class includes a method to validate credit card numbers using the Luhn 10 algorithm, ensuring only valid cards are processed.
- **Command Processing**: The `CreditCardProcessor` class processes input commands to add cards, charge cards, and credit cards, maintaining simplicity and separation of concerns.
- **Summary Generation**: The program generates a summary of all accounts, displaying balances or error messages if a card is invalid. The summary is sorted alphabetically by cardholder name.

### Dependencies

- Ruby (version 2.5 or higher)
- Minitest (for running tests)

### Installation

1. **Install Ruby**:
   - Follow the instructions on the [official Ruby website](https://www.ruby-lang.org/en/documentation/installation/) to install Ruby on your system.

2. **Install Minitest**:
   - You can install Minitest by running the following command:
     ```sh
     gem install minitest
     ```

### Building and Running the Code

1. **Source Code**:
   - Ruby code is provided in files named `credit_card_processor.rb` and `credit_card.rb`.

2. **Test Cases**:
   - Test cases are provided in file named `credit_card_processor_test.rb`.

3. **Running the Program**:
   - To run the program and process input from a file, use the following command:
     ```sh
     ruby credit_card_processor.rb input.txt
     ```
   - To provide input via STDIN, use the following command:
     ```sh
     ruby credit_card_processor.rb < input.txt
     ```

4. **Running the Tests**:
   - To run the tests, use the following command:
     ```sh
     ruby credit_card_processor_test.rb
     ```

### Example

Given an input file `input.txt` with the following content:
```
Add Tom 4111111111111111 $1000
Add Lisa 5454545454545454 $3000
Add Quincy 1234567890123456 $2000
Charge Tom $500
Charge Tom $800
Charge Lisa $7
Credit Lisa $100
Credit Quincy $200
```

Running the command:
```sh
ruby credit_card_processor.rb input.txt
```

Will produce the following output:
```
Lisa: $-93
Quincy: error
Tom: $500
```

This README provides a comprehensive overview of the design, installation steps, and usage instructions for the credit card processing program. It ensures that users can easily understand the structure of the code, install necessary dependencies, and run the program and tests successfully.