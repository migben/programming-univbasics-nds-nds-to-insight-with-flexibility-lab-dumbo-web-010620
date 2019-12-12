# Provided, don't edit
require 'directors_database' # the same hash that we've been using in the last few lessons.(fresh mental image)

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa) # flatten_a_o_a(aoa) => [elm1,elm2,elm3...]
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


#######################################################
#                   My code is below                  #
#######################################################

def movies_with_director_key(name, movies_collection)
  
  
  # returns an AoH
  # [dir_name:{}]
  
  
  # GOAL: For each Hash in an Array (movies_collection), provide
  # a collection of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes(aoh) where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
  aoh = [ ]
  idx = 0 # index
  
  while idx < movies_collection.size
    
    aoh.push( movie_with_director_name(name, movies_collection[idx]) )
    # using push because if we work later on JS then we will be unable to use shovel. Trying to form good habits now that will ease the transition.
    idx += 1
    
  end
  
  aoh
  
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash (hoh) that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN: an HoH
  #
  # Hash whose keys are the studio names and whose values are THE SUM ------> "missed this a few times"
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
  studio_gross = {}
  idx = 0
  
  while idx < collection.size
    
    studio_gross[collection[idx][:studio]] == nil ?  studio_gross[collection[idx][:studio]] = collection[idx][:worldwide_gross] : studio_gross[collection[idx][:studio]] += collection[idx][:worldwide_gross] 
    # if false then assign this k, v hash else true add to the gross under the key whose name mach
    
    idx += 1
    
  end
  
  studio_gross # HoH structure
end

def movies_with_directors_set(src)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
  dir_movies = [ ]
  idx = 0 # index
  
  while idx < src.size
    
    dir_movies.push(movies_with_director_key(src[idx][:name], src[idx][:movies]))
    
    idx += 1
  end
  
  dir_movies
  
end

#######################################################
#                   End of My Code                    #
#######################################################

# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
