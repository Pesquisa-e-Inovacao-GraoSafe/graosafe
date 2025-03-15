const int PINO_ SENSOR_TEMPERATURA - A0; // declarando varíavel constante controlador da temperatura na porta analógica 0

float temperaturaCelsius; // declaração de variável de temperatura para futuras referencias dentro do código

void setup() { // void setup é tudo o que é executado pós inicialização do programa, de forma única.

    Serial.begin(9600); // inicialização do arduino com a máquina, necessária pré
}


void 100p() { // laço de repetição infinito
    int valorleitura = analogRead(PINO_SENSOR_TEMPERATURA); // atribui o valor da leitura analógica capturada no sensor da porta A na variável valorLeitura, declarada no início do código.

    temperaturacelsius = (valorLeitura * 5.0 / 1023.0) / 0.01; // cálculo para conversão da tensão elétrica recebida pelo sensor, e transformação em célsius

    Serial-print("Temperatura: "); // exibir a string Temperatura:
    Serial print(temperaturaCelsius); // exibir na mesma linha acima o valor da
                                    //variável capturado em valorLeitura, e convertido em °C na variável temperaturaCelsius.
Serial println(" C"); // concluindo a concatenação dos três prints seriais.
delay(2000): // delay de 2000ms, ou 2 segundos, para a repetição do void loop
();