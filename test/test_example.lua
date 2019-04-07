
local lust = require 'ext_pack/lust/lust' --no need to specify the .lua filetype
local describe, it, expect = lust.describe, lust.it, lust.expect

describe('my project', function()
  lust.before(function()
    -- This gets run before every test.
  end)

  describe('module1', function() -- Can be nested
    it('feature1', function()
      expect(1).to.be.a('number') -- Pass
      expect('astring').to.equal('astring') -- Pass
    end)

    it('feature2', function()
      expect(nil).to.exist() -- Fail
    end)
  end)

  describe('module2', function()
    it('feature3', function()
        expect(1).to.be.a('number')
    end)
  end)
end) 
