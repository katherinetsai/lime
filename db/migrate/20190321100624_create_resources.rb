class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :title             # required
      t.string :url               # required, validate
      t.string :contact_email     # required, validate, hidden
      t.text :desc                # required, validate
      t.string :location          # required
      t.string :resource_email    # validate
      t.string :resource_phone    # validate
      t.string :address
      t.string :contact_name      # hidden
      t.string :contact_phone     # validate, hidden
      t.datetime :deadline        # validate
      t.text :notes               # validate, 1000 chars
      t.string :funding_amount    # validate
      t.integer :approval_status  # hidden
      t.string :approved_by       # hidden
      t.integer :flagged          # hidden?? yes
      t.text :flagged_comment     # hidden?? yes
      t.timestamps
    end

    create_table :types do |t|
      t.belongs_to :resources      # required
      t.string :name              # type name
      t.timestamps
    end

    create_table :audiences do |t|
      t.belongs_to :resources      # required
      t.string :type              # audience type
      t.timestamps
    end

    create_table :client_tags do |t| # hidden
      t.belongs_to :resources     # NOT required
      t.string :name             # client name
      t.timestamps
    end

    create_table :population_focuses do |t|
      t.belongs_to :resources     # NOT required
      t.string :type             # population focus type
      t.timestamps
    end

    create_table :campuses do |t|
      t.belongs_to :resources     # NOT required
      t.string :name             # campus name
      t.timestamps
    end

    create_table :colleges do |t|
      t.belongs_to :resources     # NOT required
      t.string :name             # college name
      t.timestamps
    end

    create_table :availabilities do |t|
      t.belongs_to :resources     # NOT required
      t.string :type             # availability type
      t.timestamps
    end

    create_table :innovation_stages do |t|
      t.belongs_to :resources     # NOT required
      t.string :name             # innovation stage name
      t.timestamps
    end

    create_table :topics do |t|
      t.belongs_to :resources    # NOT required
      t.string :name            # topic name
      t.timestamps
    end

    create_table :technologies do |t|
      t.belongs_to :resources    # NOT required
      t.string :type            # technology type
      t.timestamps
    end
  end
end
