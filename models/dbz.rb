class Character
  attr_accessor :id, :name, :signature, :arc

  def self.open_connection
    conn = PG.connect(dbname: "dragonballz", user: "postgres", password: "dragon12")
  end

  def self.all
    conn = self.open_connection

    sql = "SELECT * FROM character ORDER BY id"

    results = conn.exec(sql)

    characters = results.map do |data|
      self.hydrate data
    end

    return characters
  end

  def self.hydrate character_data
    character = Character.new

    character.id = character_data["id"]
    character.name = character_data["name"]
    character.signature = character_data["signature"]
    character.arc = character_data["arc"]

    return character
  end

  def self.find id
    conn = self.open_connection

    sql = "SELECT * FROM character WHERE id = #{id}"

    characters = conn.exec(sql)

    return self.hydrate characters[0]
  end

  def save
    conn = Character.open_connection

    if !self.id
      sql = "INSERT INTO character (name, signature, arc) VALUES ('#{self.name}', '#{self.signature}', '#{self.arc}')"
    else
      sql = "UPDATE character SET name='#{self.name}', signature='#{self.signature}', arc='#{self.arc}' WHERE id = #{self.id}"
    end
    conn.exec(sql)
  end

  def self.destroy id
    conn = self.open_connection

    sql = "DELETE FROM character WHERE id = #{id}"

    conn.exec(sql)
  end







end
