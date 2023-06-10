# Java Exceptions

Let's talk about handling exceptions in Java. Bad things can happen all the time.

[:sweat_smile: Not to me!](#not-to-me) [:cry: I know](#i-know)

## Not to Me

Do you really think so?

[> Read File](#read-fileeeee)

## I Know

I hear you!

## Read File

Let's say that you want to read a content of the file `/etc/hosts`:

```
String content = new String(Files.readAllBytes(Path.of("/etc", "host")));
```

Looks good, right? What can go wrong?

[:smile: Nothing](#nothing-can-go-wrong) [:confused: File does not exist](#file-does-not-exist)

## Nothing Can Go Wrong

Really? Look better? Are we really reading `/etc/hosts`?

[:confused: File does not exist](#file-does-not-exist)

## File Does Not Exist

Exactly! There is a typo in `host` instead of `hosts`.

Actually the method `readAllBytes` tells us that something can easily go wrong.

```
public static byte[] readAllBytes(Path path) throws IOException {
    // ...
}
```

See the `throws IOException` in the method declaration. In this particular situation we will get `java.nio.file.NoSuchFileException` which is a special case of `java.io.IOException!`.

[:thumbsup: Got it!](#no-such-element)

## No Such Element

Let's check another example:

```
System.out.println(Arrays.asList("Hello").get(1));
```

What will this piece of code do?

[:wave: Prints "Hello"](#prints-hello-oooooo) [:boom: Throws an Exception](#throws-an-exception)

## Prints Hello

Not really :confused:

[> ArrayIndexOutOfBoundsException](#arrayindexoutofboundsexception)

## Throws an Exception

:tada:

Definitely!

Don't forget that in Java the arrays and lists are **zero-based**.

## ArrayIndexOutOfBoundsException

The code will throw `ArrayIndexOutOfBoundsException` because there is only one element in the list that has an index `0`,

Let's check the method definition:

```
E get(int index);
```

[:warning: But there is no throws!](#no-throws-declaration)

## No Throws Declaration

Exactly, but there is a mention in the documentation.

```
/**
 * Returns the element at the specified position in this list.
 *
 * @param index index of the element to return
 * @return the element at the specified position in this list
 * @throws IndexOutOfBoundsException if the index is out of range
 *         ({@code index < 0 || index >= size()})
 */
```

[:face_with_raised_eyebrow:](#two-types-of-the-exceptions)

## Two Types of the Exceptions

There are two types of exceptions in Java:

1. Checked exceptions
2. Unchecked exceptions

Let's start with **Checked exceptions**. 

**Checked exceptions** need to be either _checked_ with `try..catch` blocks:

```
try {
    byte[] bytes = Files.readAllBytes(Path.of("/etc", "host"));
    System.out.println(new String(bytes, StandardCharsets.UTF_8));
} catch (IOException e) {
    e.printStackTrace();
}
```

Or they need to be declared in the method's declaration as you have seen before:

```
public static String readEtcHosts() throws IOException {
    byte[] bytes = Files.readAllBytes(Path.of("/etc", "host"));
    return new String(bytes, StandardCharsets.UTF_8);
}
```

The decision is up to you:

[:muscle: Use try..catch!](#use-try-catch) [:fireworks: Throw away!](#throw-away)

## Use Try Catch

Well, done! Now no-one knows that there is a typo in `host` because no-one checks the logs!

You know, I'm kidding, right?

[> Effective Java](#effective-java)

## Throw Away

Perfect, now it's someone's other problem to solve. Time to get some :coffee:. They can also use `throws` declaration all the way!

```
public static String otherMethod() throws IOException {
    // ...
    readEtcHosts()
    // ...
}
```

Even better, the can throw the mother of all exception which is the `Exception` class. 

```
public static String otherMethod() throws Exception {
    // ...
    readEtcHosts()
    // ...
}
```

It does not seem right to me.

## Effective Java
Joshua Bloch says in the [Effective Java](https://www.oreilly.com/library/view/effective-java/9780134686097/) book that one should use checked exceptions **only** for recoverable situations.

Can you recover from the `NoSuchFileException`?

[:thumbsup: Sure!](#sure) [:thumbsdown: No away!](#no-way)

## Sure

If you are ok when the file does not exist then you can simply handle the exception and return some default result:

```
public static String readFile(Path path) {
try {
    byte[] bytes = Files.readAllBytes(path);
    return new String(bytes, StandardCharsets.UTF_8);
} catch (IOException e) {
    return "";
}
```

[> Default to Unchecked Exceptions](#default-to-unchecked-exceptions)

## No Way

Exactly, there are situation when you require the file to exist and if it doesn't you're doomed :firecracker:.

In that situations you need to _rethrow_ the exception as an **unchecked exception** such as `IllegalArgumentException`:

```
public static String readFile(Path path) {
try {
    byte[] bytes = Files.readAllBytes(path);
    return new String(bytes, StandardCharsets.UTF_8);
} catch (IOException e) {
    throw new IllegalArgumentException("Failed to read file", e);
}
```

## Default to Unchecked Exceptions

Do you also have a feeling there might be a better way how to do it?

[:thumbsup: Show me](#show-me)

## Show Me

Well, you can't do anything with the exceptions inside the Java library but when you are writing your own exceptions you should always start with **unchecked exceptions**.

[:thinking_face: But how?](#but-how)

## But How

It's rather simple: All the unchecked exceptions are subclasses of `RuntimeException`:

```
public class SomethingBadHappenedException extends RuntimeException {
    // ...
}
```

By declaring `SomethingBadHappenedException` as subclass of `RuntimeException`, you are not forcing anyone to do any special handling unless you they want to. In an extreme example, it may crash the whole application but most of the modern application frameworks provides some handling for the exceptions which happens during the execution. 

The main benefit of using **unchecked exceptions** is that the developers can choose where they 
want to handle the exceptions and they don't have to create an infinite exception declaration chain.

Now I will tell you a secret!

[:ear: I'm listening](#listening)

## Listening

The best APIs throws **unchecked exceptions** but gives the developer methods to prevent the exception to happen. This is how the ideal method would look like if `IOException` were unchecked exception:

```
/**
 * Returns the content of the file if exists or an empty String otherwise.
 *
 * @param path the path of the file
 * @return the content of the file if exists or an empty String otherwise
 */
private static String readFile(Path path) {
    if (path.toFile().exists()) {
        byte[] bytes = Files.readAllBytes(path);
        return new String(bytes, StandardCharsets.UTF_8);
    }
    return "";
}
```

## Wrap Up

Now you know how to work with the exceptions inside your own project. Always extend `RuntimeException` to create **unchecked exception** unless you know that there is a way how to recover from the exceptional state.

Also don't forget to provide API to prevent any exception to happen.
