defmodule Explorer.Repo.Migrations.AddFieldsToInternalTransactions do
  use Ecto.Migration

  def change do
    alter table("internal_transactions") do
      add(:transaction_block_number, :integer)
      add(:transaction_index, :integer)
    end

    execute("""
    UPDATE internal_transactions
    SET
      transaction_block_number = transactions.block_number,
      transaction_index = transactions.index
    FROM transactions
    WHERE internal_transactions.transaction_hash = transactions.hash;
    """)
  end
end
