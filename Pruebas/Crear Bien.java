package com.example.tests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class CrearBien {
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
  public void testCrearBien() throws Exception {
    driver.get(baseUrl + "/abm/bien/index");
    driver.findElement(By.cssSelector("i.md.md-add")).click();
    driver.findElement(By.id("nombreBien")).clear();
    driver.findElement(By.id("nombreBien")).sendKeys("prueba");
    driver.findElement(By.id("codigoPatrimonio")).clear();
    driver.findElement(By.id("codigoPatrimonio")).sendKeys("1234");
    new Select(driver.findElement(By.id("responsableBien"))).selectByVisibleText("Papa");
    driver.findElement(By.id("codigoDeSerie")).clear();
    driver.findElement(By.id("codigoDeSerie")).sendKeys("1234");
    driver.findElement(By.id("descripcion")).clear();
    driver.findElement(By.id("descripcion")).sendKeys("Prueba de funcionamiento");
    new Select(driver.findElement(By.id("estado"))).selectByVisibleText("A Evaluar");
    new Select(driver.findElement(By.id("tipo"))).selectByVisibleText("Simple");
    new Select(driver.findElement(By.id("ubicacion"))).selectByVisibleText("Deposito");
    new Select(driver.findElement(By.id("area"))).selectByVisibleText("Sistemas");
    driver.findElement(By.cssSelector("button.btn.btn-link")).click();
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
