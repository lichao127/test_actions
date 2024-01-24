import pytest
from xmlunittest import XmlTestCase
import os
BASE_DIR=os.path.dirname(os.path.realpath(__file__))


class CustomTestCase(XmlTestCase):

    def test_good_xml(self):
        fc = open(os.path.join(BASE_DIR, 'good.xsd'))
        data = fc.read().encode()
        root = self.assertXmlDocument(data)

    def test_bad_xml(self):
        fc = open(os.path.join(BASE_DIR, 'bad.xsd'))
        data = fc.read().encode()
        with pytest.raises(AssertionError):
            self.assertXmlDocument(data)

