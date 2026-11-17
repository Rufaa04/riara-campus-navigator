# Riara Campus Navigator (C++17)

Campus map as a **weighted graph**, shortest routes with **Dijkstra's algorithm**, and location autocomplete with a **trie**.
School of Computing Sciences, Riara University - CAT 3: Data Structures and Algorithms.

## Run it

Open a terminal **in this folder** (the program looks for `data/` and `web/` next to it).

| System | Build | Run |
| --- | --- | --- |
| Windows (MinGW-w64 / Code::Blocks compiler) | `build.bat` | `navigator.exe` |
| Linux / macOS | `./build.sh` | `./navigator` |

Then open **http://localhost:8080** in Google Chrome. If port 8080 is busy: `navigator --port 9000`.

**Code::Blocks:** create a Console project, add `src/main.cpp`, then *Project > Build options*:
compiler flag `-std=c++17`; *Compiler settings > #defines* `_WIN32_WINNT=0x0A00`; *Linker settings > Link libraries* `ws2_32` and `wsock32`.
Set *Project > Properties > Build targets > Execution working directory* to this project folder.

## Other modes (for testing and your report)

    navigator --route "Main Gate" "School of Computing Sciences"   shortest route in the terminal
    navigator --verify      Dijkstra vs Floyd-Warshall: the 12 test pairs + all 240 ordered pairs
    navigator --benchmark   trie vs linear search on 20 / 1,000 / 10,000 names

## Files

    src/main.cpp     all C++ code: graph, Dijkstra, Floyd-Warshall, trie, linear search, web API
    src/httplib.h    cpp-httplib (MIT licence, https://github.com/yhirose/cpp-httplib) - localhost server
    data/campus.txt  text-file data storage: 16 NODE lines (id, map x, y, name) + 26 EDGE lines (metres)
    web/index.html   browser interface (HTML, CSS, JavaScript): search boxes, route, campus map
    screenshots/     what the interface looks like

## Where the report's pseudocode is in the code

| Report | Function / class in `src/main.cpp` |
| --- | --- |
| Algorithm 1 - DIJKSTRA | `dijkstra()` |
| Algorithm 2 - INSERT / SUGGEST | `Trie::insert()` / `Trie::suggest()` |
| Adjacency list, both directions | `Graph::addEdge()` |
| Name -> node ID (hash map) | `Graph::idByName` (`unordered_map`) |
| Floyd-Warshall check (Table 3) | `floydWarshall()` + `runVerify()` |
| Trie vs linear search (Table 4) | `Trie` vs `LinearSearch` + `runBenchmark()` |
| Walking time = distance / 1.2 m/s | `WALKING_SPEED_MPS` |

## Web API used by the page

    GET /api/graph                     locations, walkways, positions
    GET /api/suggest?q=li              trie suggestions (needs 2+ characters)
    GET /api/route?from=A&to=B         Dijkstra route, distance, walking time, steps
