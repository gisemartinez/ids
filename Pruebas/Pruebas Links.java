package com.example.tests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class PruebasLinks {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://localhost:8080/abm/";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testPruebasLinks() throws Exception {
    driver.get(baseUrl + "/abm/persona/index");
    driver.findElement(By.xpath("//a[@id='ic_bienes']/i")).click();
    driver.findElement(By.xpath("//div[@id='list-bien']/div/table/tbody/tr[3]/td[10]/a/i")).click();
    driver.findElement(By.linkText("Papa")).click();
    driver.findElement(By.linkText("Sistemas")).click();
    driver.findElement(By.xpath("//a[@id='ic_bienes']/i")).click();
    driver.findElement(By.xpath("//div[@id='list-bien']/div/table/tbody/tr[3]/td[10]/a/i")).click();
    driver.findElement(By.linkText("Laboratorio")).click();
    driver.findElement(By.xpath("//a[@id='ic_bienes']/i")).click();
    driver.findElement(By.xpath("//div[@id='list-bien']/div/table/tbody/tr[3]/td[10]/a/i")).click();
    driver.findElement(By.linkText("Simple")).click();
    driver.findElement(By.linkText("En uso")).click();
    driver.findElement(By.xpath("//a[@id='ic_estadisticas']/i")).click();
    driver.findElement(By.linkText("Permisos")).click();
    driver.findElement(By.linkText("Cerrar sesión")).click();
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
