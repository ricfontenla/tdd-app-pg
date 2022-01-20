require 'rails_helper'

describe 'User' do
  context 'views customers list' do
    it 'successfully' do
      customer1 = create(:customer)

      customer2 = create(:customer)

      visit(root_path)
      click_on('Mostrar Clientes')

      expect(page).to have_content(customer1.name)
      expect(page).to have_content(customer2.name)
      expect(page).to have_content('Listando Clientes')
      expect(page).to have_link('Novo Cliente', href: new_customer_path)
    end
  end
end
