trigger TestContextContact on Contact (before update) {
    List<List<Sobject>> result=[FIND 'Chicago' RETURNING Contact(name)];
    System.debug(result);
System.debug('Check');
}