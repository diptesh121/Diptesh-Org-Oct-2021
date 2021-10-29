@istest
public class TemperatureConverterTest {
    @istest static void testwarmtemp(){
        Decimal celsius =TemperatureConverter.FahrenheitToCelsius(70);
        system.assertEquals(21.11, celsius);
    }
    @istest static void testfreezingpoint(){
        Decimal celsius =TemperatureConverter.FahrenheitToCelsius(32);
        system.assertEquals(0, celsius);

    }
     @istest static void testNegativePoint(){
        Decimal celsius =TemperatureConverter.FahrenheitToCelsius(-10);
        system.assertEquals(-23.33, celsius);

    }
    @istest static void testBoilingPoint(){
        Decimal celsius =TemperatureConverter.FahrenheitToCelsius(212);
        system.assertEquals(0, celsius,'Boiling point temperature is not expected.');

    }
}