class MovieImporter
  def import
    import_genres
    import_movies
  end

  private

  def import_genres
    genres_list = movies_list.map { |movie| movie['genre'] }.flatten.uniq
    genres_attrs = genres_list.map { |genre_name| { name: genre_name } }
    Genre.upsert_all(genres_attrs, unique_by: :name)
  end

  def import_movies
    movies_list.each do |movie|
      movie_genres = movie['genre'].map { |genre| genres[genre] }
      Movie.create(
        title: movie['name'],
        director: movie.dig('director', 0, 'name'),
        year: Date.parse(movie['datePublished']).year,
        description: movie['description'],
        image_url: movie['image'],
        genres: movie_genres
      )
    end
  end

  def movies_list
    @movies_list ||= JSON.parse(File.read(Rails.root.join('lib/data/top250.json')))
  end

  def genres
    @genres ||= Genre.all.to_h { |genre| [genre.name, genre] }
  end
end
