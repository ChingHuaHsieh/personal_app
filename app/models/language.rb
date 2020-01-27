class Language < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
      { id: 1, value: 'English、英語、英文' },
      { id: 2, value: 'Japanese、日本語、日文' },
      { id: 3, value: 'Chinese、中国語、中文（繁體）' }
  ]
end
