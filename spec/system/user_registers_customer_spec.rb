require 'rails_helper'

describe 'User' do
  context 'creates new customer' do
    it 'successfully' do
      customer_name = create(:customer).name
      visit(customers_path)

      click_on('Novo Cliente')
      expect(page).to have_content('Novo Cliente')
      fill_in('Nome', with: customer_name)
      fill_in('Email', with: Faker::Internet.email)
      fill_in('Telefone', with: Faker::PhoneNumber.phone_number)
      attach_file('Foto do Perfil', "#{Rails.root}/spec/fixtures/avatar.jpg")
      choose(option: [true, false].sample)
      click_on('Criar Cliente')

      expect(page).to have_content('Cliente cadastrado com sucesso!')
      expect(Customer.last.name).to eq(customer_name)
    end

    it 'and fields cannot be blank' do
      visit(new_customer_path)

      click_on('Criar Cliente')

      expect(page).to have_content('não pode ficar em branco')
    end
  end
end
