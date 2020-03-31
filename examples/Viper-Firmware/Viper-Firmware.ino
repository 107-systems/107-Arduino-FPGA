/* This sketch contains the firmware for the MKR VIDOR 4000
 * based quadcopter flight controller codename 'Viper'.
 */

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include <Arduino.h>
#include <SPI.h>

#include <ArduinoMCP2515.h>
#include <ArduinoBMP388.h>
#include <ArduinoViperFpga.h>

#include "ViperConst.h"
#include "ViperFpgaUtil.h"
#include "ViperBMP388Util.h"
#include "ViperMCP2515Util.h"

/**************************************************************************************
 * FUNCTION DECLARATION
 **************************************************************************************/

uint8_t spi_transfer                 (uint8_t const);
void    mcp2515_onReceiveBufferFull  (uint32_t const, uint8_t const *, uint8_t const);
void    mcp2515_onTransmitBufferEmpty(ArduinoMCP2515 *);
void    bmp388_onSensorData          (float const pressure_hpa, float const temperature_deg);

/**************************************************************************************
 * GLOBAL VARIABLES
 **************************************************************************************/

ArduinoViperFpga fpga(viper::fpga_spi_select,
                      viper::fpga_spi_deselect,
                      spi_transfer);

ArduinoMCP2515 mcp2515(viper::mcp2515_spi_select,
                       viper::mcp2515_spi_deselect,
                       spi_transfer,
                       mcp2515_onReceiveBufferFull,
                       mcp2515_onTransmitBufferEmpty);

ArduinoBMP388 bmp388(viper::bmp388_spi_select,
                     viper::bmp388_spi_deselect,
                     spi_transfer,
                     bmp388_onSensorData);

/**************************************************************************************
 * SETUP/LOOP
 **************************************************************************************/

void setup()
{
  /* Setup Serial */
  Serial.begin(115200);
  while(!Serial) { }


  /* Setup SPI */
  SPI.begin();


  /* Setup FPGA */
  pinMode(viper::FPGA_CS_PIN, OUTPUT);
  digitalWrite(viper::FPGA_CS_PIN, HIGH);

  if (fpga.begin() != ArduinoViperFpga::Status::OK) {
    Serial.println("ArduinoViperFpga::begin() failed");
  } else {
    Serial.print("FPGA Revision: ");
    Serial.println(fpga.getRevNum(), HEX);
  }


  /* Setup MCP2515 */
  pinMode(viper::MCP2515_CS_PIN, OUTPUT);
  digitalWrite(viper::MCP2515_CS_PIN, HIGH);
  pinMode(viper::MCP2515_INT_PIN, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(viper::MCP2515_INT_PIN), viper::mcp2515_onExternalEvent, FALLING);

  mcp2515.begin();
  mcp2515.setBitRate(CanBitRate::BR_250kBPS);
  mcp2515.setNormalMode();


  /* Setup BMP388 */
  pinMode(viper::BMP388_CS_PIN, OUTPUT);
  digitalWrite(viper::BMP388_CS_PIN, HIGH);
  pinMode(viper::BMP388_INT_PIN, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(viper::BMP388_INT_PIN), viper::bmp388_onExternalEvent, FALLING);

  bmp388.begin();
}

void loop()
{

}

/**************************************************************************************
 * FUNCTION DEFINITION
 **************************************************************************************/

uint8_t spi_transfer(uint8_t const data)
{
  return SPI.transfer(data);
}

void mcp2515_onReceiveBufferFull(uint32_t const id, uint8_t const * data, uint8_t const len)
{
  /* TODO */
}

void mcp2515_onTransmitBufferEmpty(ArduinoMCP2515 * this_ptr)
{
  /* TODO */
}

void bmp388_onSensorData(float const pressure_hpa, float const temperature_deg)
{
  /* TODO */
}
