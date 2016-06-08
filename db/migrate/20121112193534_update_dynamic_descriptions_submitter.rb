class UpdateDynamicDescriptionsSubmitter < ActiveRecord::Migration

  def self.up
     add_column :dynamic_descriptions, :submitter_id, :integer
     add_constraint 'dynamic_descriptions', 'dynamic_descriptions_submitter_id', 'submitter_id', 'users', 'id'
     
     execute "update dynamic_descriptions
       set submitter_id = users.id
       from users
       where 
       (users.username = submitter or users.email = submitter) and
       submitter <> 'anonymous'"
     remove_column :dynamic_descriptions, :submitter
  end

  def self.down
    remove_constraint 'dynamic_descriptions', 'dynamic_descriptions_submitter_id'
    remove_column :dynamic_descriptions, :submitter_id
  end
end
