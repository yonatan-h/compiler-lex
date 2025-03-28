from collections import defaultdict, deque


class NFA:
    def __init__(self, regex) -> None:
        #eg) { state1: [(a, state2), (b, state3)] }
        self.graph = defaultdict(list[tuple[str|None, str]])
        self.id = 0
        self.chars:deque[str] = deque(regex)
        self.start_state:str = ""
        self.end_state:str = ""
        self.generate_graph()

    def gen_id(self)->str:
        self.id += 1
        return str(self.id)

    def generate_graph(self):
        start, end = self.handle_exp()
        self.start_state = start
        self.end_state = end
        self.graph[self.end_state] = []
    
    def handle_exp(self)->tuple[str, str]:

        start, end = self.gen_id(), self.gen_id()
        mid = start
        
        start_child, end_child = None, None
        while self.chars:
            char = self.chars.popleft()
            if char == '|':
                self.graph[mid].append((None, end))
                mid = start
            elif char == ")":
                break
            elif char == '(':
                start_child, end_child = self.handle_exp()
                self.graph[mid].append((None, start_child))
                mid = end_child
            elif char == '*':
                assert start_child is not None and end_child is not None
                self.graph[end_child].append((None, start_child))
            else:
                start_child, end_child = mid, self.gen_id()
                self.graph[mid].append((char, end_child))
                mid = end_child
                

        self.graph[mid].append((None, end))

        return start, end

    def match(self, input_string:str)->bool:
        stack:list[tuple[int, str]] = [(0, self.start_state)] 
        
        while stack:
            index, state = stack.pop()
            if state == self.end_state and index == len(input_string):
                return True
            for char, next_state in self.graph[state]:
                if char is None:
                    stack.append((index, next_state))
                elif char == input_string[index]:
                    stack.append((index+1, next_state))

        return False
    




class DFA:
    def __init__(self, nfa:NFA) -> None:
        self.nfa = nfa
        self.nfa_graph = nfa.graph
        self.graph:dict[frozenset, dict[str, frozenset]] = defaultdict(dict)
        self.start_marker = frozenset(self.expand_epsilon(set([self.nfa.start_state])))
        self.build_graph()

    def build_graph(self):
        level:deque[frozenset] = deque([self.start_marker])
        
        while level:
            marker = level.popleft()
            if marker in self.graph: continue
            next_markers = self.move_next(marker)
            for char, next_marker in next_markers.items():
                next_marker = frozenset(self.expand_epsilon(next_marker))
                self.graph[marker][char] = next_marker
                level.append(next_marker)

        
    def move_next(self, marker:frozenset)->dict[str, set]:
        next_markers = defaultdict(set)
        for state in marker:
            for char, next_state in self.nfa_graph[state]:
                if char is not None:
                    next_markers[char].add(next_state)
        return next_markers

    def expand_epsilon(self, marker:set[str])->set[str]:
        for state in list(marker):
            for char, next_state in self.nfa_graph[state]:
                if char == None:
                    marker.add(next_state)
                    marker.update(self.expand_epsilon(set([next_state])))
        return marker

    def match(self, input_string:str)->bool:
        marker = self.start_marker
        
        for char in input_string:
            if char not in self.graph[marker]:
                return False
            marker = self.graph[marker][char]

        return self.nfa.end_state in marker
        

def get_test_cases() -> list[tuple[str, str, bool]]:
    return [
        ("a", "a", True),
        ("b", "a", False),
        ("ba", "ba", True),
        ("ba|c", "ba", True),
        ("ba|c", "c", True),
        ("ba|c", "d", False),
        ("(ba)|(cd)", "ba", True),
        ("((b|a))|(cd)", "a", True),
        ("((b|a))|(cd)", "ac", False),
        ("a*", "aab", False),
        ("a*", "aaa", True),
        ("(+|-)(0|1)*.*(0|1)*", "-1.01", True),
        ("(+|-)(0|1)*.*(0|1)*", "-1.01", True),
        ("(+|-)(0|1)*.*(0|1)*", "-1.91.3", False),
    ]



def test():
    for regex, input_str, should_match in get_test_cases():
        relation_name = "matches" if should_match else "doesn't match"
        nfa_correct = NFA(regex).match(input_str) == should_match
        dfa_correct = DFA(NFA(regex)).match(input_str) == should_match
        print(f"[{nfa_correct}]", f"nfa: {regex} {relation_name} with {input_str}" )
        print(f"[{dfa_correct}]", f"dfa: {regex} {relation_name} with {input_str}")
        
        assert  nfa_correct and dfa_correct

test()

