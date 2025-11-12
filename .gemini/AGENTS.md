## Gemini Added Memories
- 往後請使用繁體中文進行所有溝通和文件產出。
- 在產生程式碼時，應優先使用 context7 相關工具 (例如 resolve_library_id 和 get_library_docs) 來獲取準確的 API 資訊，以避免產生不實的程式碼內容。
- 開發流程必須遵循測試驅動開發（TDD）模式：先寫測試，再寫實作，然後重構。
- 所有開發與測試步驟都必須在 Docker 容器中執行，以確保環境一致性。
