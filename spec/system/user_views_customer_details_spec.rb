require 'rails_helper'

describe 'User' do
  context 'views customer details' do
    it 'successfully' do
      customer = create(:customer)

      visit(customers_path)
      find(:xpath, '/html/body/table/tbody/tr[1]/td[2]').click

      expect(page).to have_content('Detalhes do Cliente')
      expect(page).to have_content(customer.name)
    end
  end
end
