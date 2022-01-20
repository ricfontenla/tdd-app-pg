require 'rails_helper'

describe 'User access home page' do
  it 'and views welcome message' do
    visit(root_path)

    expect(page).to have_content('Bem-vindo!')
  end

  it 'and registers client' do
    visit(root_path)

    expect(find('ul li')).to have_link('Mostrar Clientes', href: customers_path)
  end
end
