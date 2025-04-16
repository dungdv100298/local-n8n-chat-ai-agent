-- Enable pgvector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- Create a sample table for embeddings
CREATE TABLE IF NOT EXISTS message_embeddings (
  id SERIAL PRIMARY KEY,
  content TEXT NOT NULL,
  embedding vector(768),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create an index for similarity search
CREATE INDEX IF NOT EXISTS message_embeddings_idx ON message_embeddings USING ivfflat (embedding vector_l2_ops) WITH (lists = 100);

-- Grant permissions to n8n user
GRANT ALL PRIVILEGES ON TABLE message_embeddings TO n8n;
GRANT USAGE, SELECT ON SEQUENCE message_embeddings_id_seq TO n8n; 