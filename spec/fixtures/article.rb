module DataMapper
  module TypesFixtures

    class Article
      #
      # Behaviors
      #

      include ::DataMapper::Resource

      #
      # Properties
      #

      property :id,         Serial

      property :title,      String, :length => 255
      property :body,       Text

      property :created_at,   DateTime
      property :updated_at,   DateTime
      property :published_at, DateTime

      property :slug, Slug
      property :version, Version

      #
      # Hooks
      #

      before :valid? do
        self.slug = self.title
      end
    end # Article
  end
end
