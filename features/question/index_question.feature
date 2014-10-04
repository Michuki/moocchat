Feature: edit question as Administrator

  As an Administrator
  So that I update the answers selection to my questions
  I want to edit a question

  Scenario: Create a question, valid conditions
  Given I am at the Questions Page
  When I follow "New"
  Then I should see "Answer choices"
  When I fill in "Text text text" for "question_text"
  And I fill in "Explanation" for "question_explanation"
  And I fill in "Question Answers" for "question_Answer0"
  And I fill in "Question Answers" for "question_Answer1"
  And I fill in "Question Answers" for "question_Answer2"
  And I fill in "Question Answers" for "question_Answer3"
  And I fill in "Question Answers" for "question_Answer4"
  And I fill in "1" for "question_correct_answer_index"
  And I press "Create Question"
  Then I should see "Question was successfully created"

  Scenario: Create a question, missing condition

  Given I am at the Questions Page
  When I follow "New"
  Then I should see "Answer choices"
  When I fill in "Text text text" for "question_text"
  And I fill in "Explanation" for "question_explanation"
  And I fill in "1" for "question_correct_answer_index"
  And I press "Create Question"
  Then I should see "1 error prevented this question from being saved:"

  Scenario: Show a question, valid conditions
  Given I am at the Questions Page
  When I follow "New"
  Then I should see "Answer choices"
  When I fill in "Text text text" for "question_text"
  And I fill in "Explanation" for "question_explanation"
  And I fill in "Question Answers" for "question_Answer0"
  And I fill in "Question Answers" for "question_Answer1"
  And I fill in "Question Answers" for "question_Answer2"
  And I fill in "Question Answers" for "question_Answer3"
  And I fill in "Question Answers" for "question_Answer4"
  And I fill in "1" for "question_correct_answer_index"
  And I press "Create Question"
  Then I should see "Explanation"
  When I follow "Back"
  When I follow "1"
  Then I should see "Explanation"


  Scenario: Delete a question
  Given I am at the Questions Page
  When I follow "New"
  Then I should see "Answer choices"
  When I fill in "Text text text" for "question_text"
  And I fill in "Explanation" for "question_explanation"
  And I fill in "Question Answers" for "question_Answer0"
  And I fill in "Question Answers" for "question_Answer1"
  And I fill in "Question Answers" for "question_Answer2"
  And I fill in "Question Answers" for "question_Answer3"
  And I fill in "Question Answers" for "question_Answer4"
  And I fill in "1" for "question_correct_answer_index"
  And I press "Create Question"
  Then I should see "Explanation"
  When I follow "Delete"
