import random,re


def generate_sample_list(user_limit):
    user_limit = user_limit
    sample_list = []
    for i in range(1, user_limit):
        if i * (i - 2) % 3 == 0:
            sample_list.append(i ** 2)
    return sample_list


def list_comprehension(limit):
    new_list = [i ** 2 for i in range(1, limit) if i * (i - 2) % 3 == 0]
    return new_list


def list_reverse_slice(input_list):
    input_list = list(input_list)
    input_list = input_list[::-1]
    return input_list


def list_reverse_loop(input_list):
    loop_len = int(len(input_list) / 2)
    list_len = len(input_list) - 1
    for i in range(loop_len):
        input_list[i], input_list[list_len] = input_list[list_len], input_list[i]
        list_len = list_len - 1

    return input_list


def fib_loop(n):
    if n <= 1:
        return n
    a, b = 1, 1

    for i in range(2, n + 1):
        a, b = b, a + b

    return b


def fib_recursion_1(prev1, prev2, count):
    for each_count in range(0, count):
        newFibo = prev1 + prev2
        prev2 = prev1
        prev1 = newFibo
        count += 1
        fib_recursion_1(prev1, prev2, count)
        return newFibo
    else:
        return


def fib_recursion_2(n):
    if n == 0 or n == 1:
        return 1
    else:
        each_item = fib_recursion_2(n - 1) + fib_recursion_2(n - 2)
        return each_item


def build_in_sort(input_list):
    print(input_list)
    input_list = sorted(input_list)
    return input_list


def bubble_sort(input_list):
    loop_len = len(input_list)
    for i in range(loop_len):
        for j in range(0, loop_len - i - 1):
            if input_list[j] > input_list[j + 1]:
                input_list[j], input_list[j + 1] = input_list[j + 1], input_list[j]
    return input_list


def selection_sort(input_list):
    n = len(input_list)
    for i in range(n):
        min_index = i
        for j in range(i + 1, n):
            if input_list[j] < input_list[min_index]:
                min_index = j

        input_list[i], input_list[min_index] = input_list[min_index], input_list[i]
    return input_list


def quick_sort(input_list):
    if len(input_list) <= 1:
        return input_list
    pivot = input_list[int(len(input_list) / 2)]
    left = [x for x in input_list if x < pivot]
    print("left", pivot, left)
    middle = [x for x in input_list if x == pivot]
    print("middle", pivot)
    right = [x for x in input_list if x > pivot]
    print("right", pivot, right)
    return quick_sort(left) + middle + quick_sort(right)


def lyric_counter():
    try:
        local_file = open('lyric', 'r')
    except IOError:
        print("no file found")
    else:
        lyric_content = local_file.read()
        words = re.findall(r'\w+', lyric_content)
        word_list = []
        for i in words:
            word_list.append(i)

    word_set = list(set(word_list))

    word_freq = []
    for w in word_set:
        word_freq.append("0")

    for y in word_list:

        for x in range(int(len(word_set))):
            if y == word_set[x]:
                word_freq[x] = int(word_freq[x]) + 1
    # print word_freq
    # print word_set
    new_l = zip(word_freq, word_set)
    new_l.sort(reverse=True)
    for ii in range(10):
        print(new_l[ii])


#========================================================
def smallest_factor(prime_number):
    if prime_number <= 1:
        return None  # Factors are not defined for numbers <= 1
    for i in range(2, int(prime_number ** 0.5) + 1):

        if prime_number % i == 0:
            return i
    return prime_number  # If no factor found, n is prime and its smallest factor is itself


def ip_address_generator():
    ip_address = []
    for i in range(4):
        ip_address.append(str(random.randint(0, 255)))
    ip_address = ".".join(ip_address)
    return ip_address


def find_duplicates(input_list):
    unique_items_list = []
    return_duplicates = []
    for each_item in input_list:

        if each_item not in unique_items_list:
            unique_items_list.append(each_item)

        elif each_item not in return_duplicates:
            return_duplicates.append(each_item)



    return return_duplicates




def topKFrequent(words, k):
    word_set = list(set(words))
    print(word_set)

    word_freq = []
    for w in word_set:
        word_freq.append("0")
    for y in words:

        for x in range(len(word_set)):
            if y == word_set[x]:
                word_freq[x] = int(word_freq[x]) + 1

    new_tuple = zip(word_freq, word_set)

    new_tuple = sorted(new_tuple,reverse=True)
    return_list = []
    for i in range(k):
        print(new_tuple[i])
        return_list.append(new_tuple[i])
    return return_list

def validate_ipv4_general(ip_address):
    # Split the IP by dots
    parts = ip_address.split('.')
    print(parts)
    # There should be exactly 4 parts
    if len(parts) != 4:
        return False

    for part in parts:
        # Each part should be a number
        if not part.isdigit():
            return False

        # Each number should be between 0 and 255
        num = int(part)
        if num < 0 or num > 255:
            return False

        # Prevent leading zeros (e.g., "01" is not valid)
        if len(part) > 1 and part[0] == '0':
            return False

    return True

def validate_ipv4_regex(ip):
    # Define the IPv4 regex pattern
    pattern = r"^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$"
    # Use full match to validate the IP
    return re.fullmatch(pattern, ip) is not None

def validate_email_regex(email):
    pattern = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]{3}$'

    return re.fullmatch(pattern, email) is not None

def valid_parentheses_nostack(input_string):

    '''
    Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
    An input string is valid if:
    Open brackets must be closed by the same type of brackets.
    Open brackets must be closed in the correct order.
    Every close bracket has a corresponding open bracket of the same type.
    :param s:
    :return:
    '''
    round_open = 0
    square_open = 0
    curly_open = 0

    for char in input_string:
        if char == '(':
            round_open += 1
        elif char == ')':
            if round_open == 0:
                return False
            round_open -= 1
        elif char == '[':
            square_open += 1
        elif char == ']':
            if square_open == 0:
                return False
            square_open -= 1
        elif char == '{':
            curly_open += 1
        elif char == '}':
            if curly_open == 0:
                return False
            curly_open -= 1

    # At the end, all counters must be zero for valid parentheses
    return round_open == 0 and square_open == 0 and curly_open == 0


def valid_parentheses_stack(input_string):
    stack = []
    mapping = {')': '(', ']': '[', '}': '{'}  # Mapping of closing to opening brackets

    for char in input_string:

        if char in mapping:

            # Pop the top of the stack, or use a dummy value if the stack is empty
            if stack:
                top_element = stack.pop()
            else:
                top_element ='#'

            # Check if the popped element matches the corresponding opening bracket
            if mapping[char] != top_element:
                return False
        else:
            # Push opening brackets onto the stack
            stack.append(char)

    # If the stack is empty, all parentheses are valid and closed


    if not stack:
        return True
    else:
        return False

def search_insert(nums, target):
    if target < nums[0]:
        return 0
    elif target in nums:

        return (nums.index(target))

    else:
        len_of_number = int(nums[-1])

        if len_of_number > target:
            for x in nums:
                if x > target:
                    return (nums.index(x))


        elif len_of_number < target:

            return len(nums)

if __name__ == '__main__':

    print(search_insert([1,3,5,7],9))
