import { test, expect } from '@playwright/test';

test('Integration Test Creating new user, add category and Add transaction', async ({ page }) => {
  // Navigate to the sign-in page
  await page.goto('/users/sign_in');
  
  // Fill in the sign-up form
  await page.getByLabel('Email').fill('gabidi4920@wisnick.com');
  await page.getByLabel('Password', { exact: true }).fill('123456');

  // Click the 'Sign up' button
  await page.getByRole('button', { name: 'Log in' }).click();
  
  // Expectation: After signing up, should be redirected to a page with 'Add a new category' link
  await expect(page.getByRole('link', { name: 'Add a new category' })).toBeVisible();

  // Add a new category
  await page.getByRole('link', { name: 'Add a new category' }).click();
  await page.getByLabel('Name').fill('CatTestNew');
  await page.getByLabel('Icon').selectOption('food_bank');
  await page.getByRole('button', { name: 'Add Category' }).click();
});
