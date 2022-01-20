require 'rails_helper'

describe 'User' do
  context 'deletes customer' do
    it 'successfully' do
      create(:customer)

      visit(customers_path)
      find(:xpath, '/html/body/table/tbody/tr[1]/td[4]').click
      1.second
      page.driver.browser.switch_to.alert.accept

      expect(page).to have_content('Cliente excluído com sucesso!')
    end
  end
end
