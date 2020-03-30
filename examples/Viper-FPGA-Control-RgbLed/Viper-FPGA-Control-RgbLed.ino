/* This example demonstrates how to control the RGB LED located on the
 * VidorCameraAdapter via MCU-FPGA interface.
 */

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include <ArduinoViperFpga.h>

#include <SPI.h>

/**************************************************************************************
 * GLOBAL CONSTANTS
 **************************************************************************************/

static int const FPGA_CS_PIN = 3; /* Pin 3 = D3 = PA11 */

/**************************************************************************************
 * FUNCTION DECLARATION
 **************************************************************************************/

void    spi_select  ();
void    spi_deselect();
uint8_t spi_transfer(uint8_t const);

/**************************************************************************************
 * GLOBAL VARIABLES
 **************************************************************************************/

ArduinoViperFpga fpga(spi_select,
                      spi_deselect,
                      spi_transfer);

/**************************************************************************************
 * SETUP/LOOP
 **************************************************************************************/

void setup()
{
  Serial.begin(115200);
  while(!Serial) { }

  /* Setup SPI access */
  SPI.begin();
  pinMode(FPGA_CS_PIN, OUTPUT);
  digitalWrite(FPGA_CS_PIN, HIGH);

  if(ArduinoViperFpga::Status::OK != fpga.begin()) {
    Serial.println("ArduinoViperFpga::begin() failed");
  }

  Serial.print("FPGA Revision: ");
  Serial.println(fpga.getRevNum(), HEX);

  fpga.setIntensityRed  (0);
  fpga.setIntensityGreen(127);
  fpga.setIntensityBlue (255);
}

void loop()
{

}

/**************************************************************************************
 * FUNCTION DEFINITION
 **************************************************************************************/

void spi_select()
{
  digitalWrite(FPGA_CS_PIN, LOW);
}

void spi_deselect()
{
  digitalWrite(FPGA_CS_PIN, HIGH);
}

uint8_t spi_transfer(uint8_t const data)
{
  return SPI.transfer(data);
}
