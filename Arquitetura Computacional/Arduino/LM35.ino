// Definição da variável para recebimento dos dados da porta analógica A0
const int PINO_SENSOR_TEMPERATURA = A0;

// Definição da variável do tipo float (aceitar valores decimais) para alocar a temperatura futuramente.
float temperaturaCelsius;

// Função para inicializar junto do programa. Irá rodar apenas uma vez.
void setup(){

  Serial.begin(9600); // Inicialização do Arduino

}

// Função que vai se repetir enquanto o código se manter aberto
void loop() {

  // Variável para leitura dos dados da porta analógica A0 definida no começo do código
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA); 
  
  // Conversão dos dados recebidos pela leitura para ºC
  temperaturaCelsius = (valorLeitura * 5.0 / 1023.0) / 0.01;

  // Variável para valor fixo de temperatura máxima que o grão pode atingir enquanto se mantém saudável.
  int tempMaxima = 30;

  // Variável para valor fixo de temperatura mínima que o grão pode atingir enquanto se mantém saudável.
  int tempMinima = 20;
  
  // Variável para valor ideal da temperatura do grão para maior eficiência do grão.
  int tempIdeal = 25;
  

  // Bloco de estrutura de decisão. Temperaturas entre 25°C e 23°C serão acrescidas em 1°C e entre 27°C e 26°C diminuidas em 1°C apenas para demonstração.
  if (temperaturaCelsius >= 23){

    if (temperaturaCelsius <= 25){

      temperaturaCelsius += 1;

    }

    else if (temperaturaCelsius <= 27){

      temperaturaCelsius -= 1;

    } 

  };

  Serial.print("Temp_Atual:"); // Nome da label (rótulo) para temperatura atual. Sintaxe: ("nome_da_label:"). ATENÇÃO: o caractere ":" é indispensável.
  Serial.print(temperaturaCelsius); // Registro do valor para a label Temp_Atual
  Serial.print(","); // Necessário para divisão das labels e valores
  Serial.print("Temp_Ideal:"); // Label para temperatura ideal
  Serial.print(tempIdeal); // Registro do valor para a label Temp_Ideal
  Serial.print(","); // Necessário para divisão das labels e valores
  Serial.print("Temp_Maxima:"); // Label para temperatura máxima
  Serial.print(tempMaxima); // Registro do valor para a label Temp_Maxima
  Serial.print(","); // Necessário para divisão das labels e valores
  Serial.print("Temp_Minima:"); // Label para temperatura mínima
  Serial.println(tempMinima); // Use Serial.println(). Registro do valor para a label Temp_Minima

  delay(500); // Tempo de "descanso" entre uma execução e outra do loop.

}