package com.example.tests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class CrearPersona {
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
  public void testCrearPersona() throws Exception {
    driver.get(baseUrl + "/abm/bien/");
    driver.findElement(By.xpath("//a[@id='ic_personas']/i")).click();
    driver.findElement(By.cssSelector("i.md.md-add")).click();
    driver.findElement(By.id("nombre")).clear();
    driver.findElement(By.id("nombre")).sendKeys("Prueba");
    driver.findElement(By.id("apellido")).clear();
    driver.findElement(By.id("apellido")).sendKeys("Prueba");
    driver.findElement(By.id("dni")).clear();
    driver.findElement(By.id("dni")).sendKeys("35612676");
    new Select(driver.findElement(By.id("area"))).selectByVisibleText("Sistemas");
    new Select(driver.findElement(By.id("role"))).selectByVisibleText("ROLE_SUPERVISOR");
    driver.findElement(By.id("username")).clear();
    driver.findElement(By.id("username")).sendKeys("prueba@f");
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys("pass");
    driver.findElement(By.id("confirmPassword")).clear();
    driver.findElement(By.id("confirmPassword")).sendKeys("pass");
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
