module CommandsHelper
    module MetadataFile   #
        def self.get_file_name(input)  # 'metadata file1'
            file_name = input[9..(input.length-1-4)]
            file_name = "#{file_name}_metadata.txt"
            return file_name
        end

        def self.get_not_persisted_metadata(file_name, file_content, path, current_user)
            path = path.map! {|x| x + "/" }      # path =>  [ "home/", "b/", "c/", "d/" ]
            path = path.join            #   "home/b/c/d/"
            metadata = ['', 
                        'Name: ' + file_name.to_s ,
                        'Type: ' + '.txt',
                        'Folder path: ' + path,
                        'Size characters: ' + file_content.size.to_s + ' characters',       #.bytesize
                        'Date created: ' + Time.now.to_s, 
                        'Date modified: ' + Time.now.to_s,
                        'Attributes: ' + 'A',
                        'Owner: ' + current_user,
                        '' ]    
                    return metadata                     
        end

        def self.get_persisted_metadata(file_name, current_path) 
        
            metadata = ['',
                        'Name: ' + file_name,
                        'Type: ' + '.txt',
                        'Folder path: ' + current_path,
                        'Size: ' + File.size?( file_name ).to_s + ' characters',       # = .bytesize
                        'Date created: ' + Time.now.to_s, 
                        'Date modified: ' + Time.now.to_s,
                        'Attributes: ' + 'A',
                        'Owner: ' + 'current_user',
                        '' ] 

            return metadata

        end
    end
end
