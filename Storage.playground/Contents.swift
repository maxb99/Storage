import UIKit

// Получить папку Документы для текущего приложения и пользователя
let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
print(directory.absoluteString)
let url = directory.appendingPathComponent("note").appendingPathExtension("plist")
print(url.absoluteString)



/// Заметка
struct Note: Codable{
    
    /// Заголовок заметки
    let title: String
    
    // Текст заметки
    let text: String
    
    /// Время создания заметки
    let timestamp: Date
}


let note = Note(title: "Список покупок", text: "Яблоки, груши, сливы", timestamp: Date())

let notes = [
    Note(title: "Интересные идеи", text: "Яблоки, груши, сливы", timestamp: Date()),
    Note(title: "Не забыть", text: "Яблоки, груши, сливы", timestamp: Date()),
    Note(title: "Траты", text: "Яблоки, груши, сливы", timestamp: Date()),
    Note(title: "Доходы", text: "Яблоки, груши, сливы", timestamp: Date()),
    Note(title: "Почитать", text: "Яблоки, груши, сливы", timestamp: Date())

]

// создаем кодировщик
let encorder = PropertyListEncoder()
// кодируем заметку
if let encodedNote = try? encorder.encode(notes){
    print(encodedNote)
    
// запись в файл
    try?encodedNote.write(to: url, options: .noFileProtection)
    
    
// чтение из файла
    if let data = try? Data(contentsOf: url) {
        
    
    
// создаем декодировщик
    let decoder = PropertyListDecoder()
// декодируем заметку
    if let decodedNote = try? decoder.decode([Note].self, from: encodedNote) {
        print(decodedNote)
      }
  }
}






