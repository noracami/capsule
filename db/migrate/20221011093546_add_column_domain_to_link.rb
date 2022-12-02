# frozen_string_literal: true

class AddColumnDomainToLink < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :domain, :string
  end
end
