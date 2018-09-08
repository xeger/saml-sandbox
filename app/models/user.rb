User = Struct.new(:id, :email)

class User
  TEST_FIXTURE = self.new(1, 'alice@example.com')
end
