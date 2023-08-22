class Has {
  const Has();
}

class Compose {
  const Compose();
}

class HasDefault {
  final Object value;

  const HasDefault(this.value);
}

class Ext {
  final bool has;

  const Ext({
    this.has = false,
  });
}

const extHas = Ext(has: true);
