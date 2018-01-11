class AddClaimToAgents < ActiveRecord::Migration[5.0]
  def change
    add_reference :agents, :claim, foreign_key: true
  end
end
