const int PINO_SENSOR_TEMPERATURA = A0; // definição da variável para recebimento dos dados da porta analógica A0
float temperaturaCelsius; // criação de variável do tipo float ( aceitar valores decimais ) para alocar a temperatura futuramente.

void setup(){ // função inicialiada junto do programa, vai rodar só uma vez

  Serial.begin(9600); // inicialização do arduino

}

void loop() { // função que vai se repetir enquanto o código se manter aberto

  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA); // leitura dos dados da porta analógica A0 definida no começo do código
  temperaturaCelsius = (valorLeitura * 5.0 / 1023.0) / 0.01; // conversão dos dados recebidos pela leitura, com a conversão em °C.
  int tempMaxima = 30; // valor fixo de temperatura máxima que o grão pode atingir enquanto se mantém saudável.
  int tempMinima = 20; // valor fixo da temperatura mínima que o grão pode atingir enquanto se mantém saudável.
  int tempIdeal = 25; // valor ideal da temperatura para maior eficiência do grão.
  if(temperaturaCelsius >= 23){ // bloco de estrutura de decisão, onde se a temperatura estiver entre 23 e 25, adiciona um
    if(temperaturaCelsius < 25){
      temperaturaCelsius += 1;
    } else if(temperaturaCelsius <= 27){ // se a temperatura estiver entre 25 e 27, diminui um
    temperaturaCelsius -= 1;
    }; 
  } // intuíto de deixar os valores o mais próximo o possível do valro ideal
  Serial.print("Temp_Atual:"); // nome da label - síntaxe - ("NomeTaltaltal:" ) o : é obrigatório
  Serial.print(temperaturaCelsius); // registro do valor da label Temp_Atual
  Serial.print(","); // vírgula pra separação das labels e valores
  Serial.print("Temp_Ideal:"); // label 2
  Serial.print(tempIdeal);
  Serial.print(",");
  Serial.print("Temp_Maxima:"); // label 3
  Serial.print(tempMaxima);
  Serial.print(",");
  Serial.print("Temp_Minima:"); // label 4
  Serial.println(tempMinima);

  delay(500); // delay de 500ms, ou 0.5 segundos, para a repetição da estrutura loop.

}
