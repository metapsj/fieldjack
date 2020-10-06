# redesign

consider implementing a broker
detail components of a broker

---

# coordinator

- start
- stop
- log

---

# discovery

- enlist
- delist
- list
- notify

---

# channels

- create
- destroy
- list
- find

---

# messaging

- send
- listen
- notify

---

# typical consumer / producer workflow

consumer connect to channel
channel blocks until producer is available
producer connects to channel
prducer send message
consumer receives message

