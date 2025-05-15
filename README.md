# Kin's Policy OCR Coding Challenge

Hello! And thanks for checking this repository. Below, please find details on how to run this project locally.

## Instructions
1. Clone the repository (SSH recommended)
```bash
git clone git@github.com:VOnTeacher/policy-number-challenge.git
```

![clone instructions](images/clone_instructions.png)

2. CD into the directory
```bash
$ cd policy-number-challenge
policy-number-challange git:(main)
```

3. Ensure you are running `ruby 3.4.1`
```bash
$ ruby -v
ruby 3.4.1 (2024...)
```

4. Make the `ocr_parser.rb` file executable, just in case
```bash
$ chmod +x ./lib/ocr_parser.rb
```

5. Run the parser with the following options
```bash
$ ./lib/ocr_parser.rb --include-status spec/fixtures/user_story_3.txt
```

You should see a `findings.txt` created in your root directory, with results in line with example provided from the project documentation. Or you can `cat findings.txt` to display results in the command line.

![findings](images/findings.png)
![findings](images/findings2.png)
