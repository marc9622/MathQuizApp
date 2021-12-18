class MultipleChoiseQuestion extends Question{ 
  TextField questionInput;
  TextField answerInput;
  
  TextField mulitiQ1Input;
  TextField mulitiQ2Input;
  TextField mulitiQ3Input;
  
  int numberOfMulitQ = 0;
  
  QuestionAddInputButton addMultipuleQuestionButton;
  
  MultipleChoiseQuestion(int nr, String question_, String answer_){
    super(nr,question_,answer_);
    
    questionInput = new TextField(375 + 320, 9 + 110, 750, 50, "Skriv dit spørgsmål herunder");
    answerInput = new TextField(375 + 320, 100 + 110, 750, 50, "Skriv dit svar her");
    mulitiQ1Input = new TextField(0, 0, 750, 50, "Skriv svarmulighed to.");
    mulitiQ2Input = new TextField(0, 0, 750, 50, "Skriv svarmulighed tre.");
    mulitiQ3Input = new TextField(0, 0, 750, 50, "Skriv svarmulighed fire.");
    
    addMultipuleQuestionButton = new QuestionAddInputButton(150 + 550, 200 + 180, "+");
    addMultipuleQuestionButton.w = 750;
    
    mulitiQ1Input.hidden = true;
    mulitiQ2Input.hidden = true;
    mulitiQ3Input.hidden = true;
    
    keyListeners.add(questionInput);
    keyListeners.add(answerInput);
    
    keyListeners.add(mulitiQ1Input);
    keyListeners.add(mulitiQ2Input);
    keyListeners.add(mulitiQ3Input);
  }
  
  void teacherDisplay(){
    question = questionInput.input;
    answer = answerInput.input;
    fill(0);
    questionInput.display();
    answerInput.display();
    mulitiQ1Input.display();
    mulitiQ2Input.display();
    mulitiQ3Input.display();
    
    fill(0);
    textSize(22);
    if(mulitiQ1Input.hidden == false) {
      text("Skriv de forkerte svarmuligheder nedenfor:", 240 + 320, 200 + 110);
    }else{
      text("Tilføj evt. multiple choice spørgsmål herunder:", 260 + 320, 200 + 110);
    }
    
    addMultipuleQuestionButton.display();
  }
  
  void addMulitiQInput(){
    float startX = 700;
    float startY = 380;
    
    numberOfMulitQ++;
    
    if(numberOfMulitQ == 1){ 
      mulitiQ1Input.pos.x = startX;
      mulitiQ1Input.pos.y = startY;
      mulitiQ1Input.hidden = false;
    }
    
    if(numberOfMulitQ == 2){
      mulitiQ2Input.pos.x = startX;
      mulitiQ2Input.pos.y = startY + 75;
      mulitiQ2Input.hidden = false;
    }
    
    if(numberOfMulitQ == 3){
      mulitiQ3Input.pos.x = startX;
      mulitiQ3Input.pos.y = startY + 150;
      mulitiQ3Input.hidden = false;
    }
    
    if(numberOfMulitQ == 3){
      addMultipuleQuestionButton.hidden = true;
    } else {
      addMultipuleQuestionButton.y += 75;
    }
  }
  
  
  
}
