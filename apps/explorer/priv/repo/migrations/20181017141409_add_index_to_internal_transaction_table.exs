defmodule Explorer.Repo.Migrations.AddIndexToInternalTransactionTable do
  use Ecto.Migration

  def change do
    create(
      index("internal_transactions", [
        :to_address_hash,
        :from_address_hash,
        :created_contract_address_hash,
        :type,
        :index
      ])
    )

    execute("""
    CREATE INDEX itx_transactions_block_number_tx_index_index
    ON internal_transactions (transaction_block_number DESC, transaction_index DESC, "index" DESC);
    """)
  end
end
