require 'rails_helper'

describe 'User' do
  context 'edits customer details' do
    it 'successfully' do
      create(:customer)

      new_name = Faker::Name.name

      visit(customers_path)
      find(:xpath, '/html/body/table/tbody/tr[1]/td[3]').click
      fill_in('Nome', with: new_name)
      click_on('Atualizar Cliente')

      expect(page).to have_content('Cliente atualizado com sucesso!')
      expect(page).to have_content(new_name)
    end
  end
end
