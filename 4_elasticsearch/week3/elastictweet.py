# https://www.pg4e.com/code/elastictweet.py

# Example from:
# https://elasticsearch-py.readthedocs.io/en/master/

# pip install 'elasticsearch<7.14.0'

# (If needed)
# https://www.pg4e.com/code/hidden-dist.py
# copy hidden-dist.py to hidden.py
# edit hidden.py and put in your credentials

import random
from datetime import datetime
from pathlib import Path

import hidden
from elasticsearch import Elasticsearch, RequestsHttpConnection

secrets = hidden.elastic()

es = Elasticsearch(
    [secrets["host"]],
    http_auth=(secrets["user"], secrets["pass"]),
    url_prefix=secrets["prefix"],
    scheme=secrets["scheme"],
    port=secrets["port"],
    connection_class=RequestsHttpConnection,
)
indexname = secrets["user"]

# Start fresh
# https://elasticsearch-py.readthedocs.io/en/master/api.html#indices
res = es.indices.delete(index=indexname, ignore=[400, 404])
print("Dropped index")
print(res)

res = es.indices.create(index=indexname)
print("Created the index...")
print(res)

tweets = (
    Path("tweets.txt").read_text().splitlines()
)  # Doing it in this way because I know there are few tweets
authors = ["kimchy", "Dr. Chuck", "aHardReset"]
_type = "tweet"

for tweet in tweets:
    doc = {
        "author": random.choice(authors),
        "type": _type,
        "text": tweet,
        "timestamp": datetime.now(),
    }

    # Note - you can't change the key type after you start indexing documents
    res = es.index(index=indexname, id="abc", body=doc)
    print("Added document...")
    print(res["result"])

res = es.get(index=indexname, id="abc")
print("Retrieved document...")
print(res)

# Tell it to recompute the index - normally it would take up to 30 seconds
# Refresh can be costly - we do it here for demo purposes
# https://www.elastic.co/guide/en/elasticsearch/reference/current/indices-refresh.html
res = es.indices.refresh(index=indexname)
print("Index refreshed")
print(res)

# Read the documents with a search term
# https://www.elastic.co/guide/en/elasticsearch/reference/current/query-filter-context.html
x = {
    "query": {
        "bool": {
            "must": {"match": {"text": "machine language"}},
            "filter": {"match": {"type": "tweet"}},
        }
    }
}

res = es.search(index=indexname, body=x)
print("Search results...")
print(res)
print()
print("Got %d Hits:" % len(res["hits"]["hits"]))
for hit in res["hits"]["hits"]:
    s = hit["_source"]
    print(f"{s['timestamp']} {s['author']}: {s['text']}")
