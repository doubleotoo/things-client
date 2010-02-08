module Things
  # Things::Person
  #
  # People in Things cannot be created, they are fetched from Address Book
  class Person < Reference::Record
    
    properties :name
    # identifier is required for creation
    identifier :person
    # collection is used for findings
    collection :people
    
    # Find a Person in Address Book and add a teammate in Things
    #
    # Returns a Things::Person object
    def self.create(address_book_name)
      reference = Things::App.instance.add_teammate_named(address_book_name)
      raise 'Could not find person in Address Book' if reference == :missing_value
      build(reference)
    end
    
    # Not supported by Things::Person
    # 
    # Raises a RuntimeError when called
    def save
      raise 'Currently Things does not support this method'
    end
    
    # Not supported by Things::Person
    # 
    # Raises a RuntimeError when called
    def delete
      raise 'Currently Things does not support this method'
    end
    
  end
  
end